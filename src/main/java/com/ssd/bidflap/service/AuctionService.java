package com.ssd.bidflap.service;

import com.ssd.bidflap.domain.Auction;
import com.ssd.bidflap.domain.Bidder;
import com.ssd.bidflap.domain.Product;
import com.ssd.bidflap.domain.Member;
import com.ssd.bidflap.domain.enums.AuctionStatus;
import com.ssd.bidflap.repository.AuctionRepository;
import com.ssd.bidflap.repository.BidderRepository;
import com.ssd.bidflap.repository.ProductRepository;
import com.ssd.bidflap.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class AuctionService {

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private AuctionRepository auctionRepository;
    @Autowired
    private BidderRepository bidderRepository;
    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    //경매시작
    @Transactional
    public void startAuction(Long id, int duePeriod){
        Product product = productRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid product ID"));
        //좋아요 10개 이하면, 경매 불가능
//        if (product.getLikeCount() < 10) {
//            throw new IllegalStateException("at least like 10 ");
//        }
        //경매종료날짜
        LocalDateTime dueDate = LocalDateTime.now().plusDays(duePeriod);
        //경매 객체 생성
        Auction auction = Auction.builder()
                .period(duePeriod)
                .productId(product.getId())
                .highPrice(product.getPrice())
                .build();


        product.setAuction(auction);
        product.setStatus(AuctionStatus.STARTED);
        auctionRepository.save(auction);
        productRepository.save(product);
    }

    //입찰
    @Transactional
    public void placeBid(Long productId, int bidPrice, String nickname) {
        if (nickname == null || nickname.isEmpty()) {
            throw new IllegalArgumentException("로그인이 필요합니다.");
        }

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("상품을 찾을 수 없습니다."));

        Auction auction = product.getAuction();
        if (auction == null) {
            throw new IllegalArgumentException("해당 상품은 경매가 시작되지 않았습니다.");
        }

        Member member = memberRepository.findByNickname(nickname)
                .orElseThrow(() -> new IllegalArgumentException("사용자를 찾을 수 없습니다."));
        if (bidPrice <= auction.getHighPrice()) {
            throw new IllegalArgumentException("현재 최고 입찰가보다 높은 가격을 입력해야 합니다.");
        }

        Bidder bidder = Bidder.builder()
                .price(bidPrice)
                .member(member)
                .auction(auction)
                .build();

        bidderRepository.save(bidder);

        auction.updateHighPrice(bidPrice);
        auctionRepository.save(auction);
    }


}
