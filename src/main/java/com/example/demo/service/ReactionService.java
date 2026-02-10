package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.repository.ReactionRepository;
import com.example.demo.vo.ResultData;

@Service
public class ReactionService {
    
    @Autowired
    private ReactionRepository reactionRepository;

    @Transactional
    public ResultData toggleLike(int memberId, int articleId) {
        Integer point = reactionRepository.getReactionPoint(memberId, articleId);
        if (point == null) point = 0;

        if (point == 1) {
            reactionRepository.deleteReaction(memberId, articleId);
            reactionRepository.decreaseArticleLikeCount(articleId);
            return ResultData.from("S-2", "좋아요를 취소했습니다.");
        }

        if (point == -1) {
            reactionRepository.deleteReaction(memberId, articleId);
            reactionRepository.decreaseArticleDislikeCount(articleId);
            
            reactionRepository.insertLikeReaction(memberId, articleId);
            reactionRepository.increaseArticleLikeCount(articleId);
            return ResultData.from("S-3", "싫어요를 취소하고 좋아요를 눌렀습니다.");
        }


        reactionRepository.insertLikeReaction(memberId, articleId);
        reactionRepository.increaseArticleLikeCount(articleId);
        return ResultData.from("S-1", "좋아요를 눌렀습니다.");
    }

    @Transactional
    public ResultData toggleDislike(int memberId, int articleId) {
        Integer point = reactionRepository.getReactionPoint(memberId, articleId);
        if (point == null) point = 0;

        if (point == -1) {
            reactionRepository.deleteReaction(memberId, articleId);
            reactionRepository.decreaseArticleDislikeCount(articleId);
            return ResultData.from("S-2", "싫어요를 취소했습니다.");
        }

        if (point == 1) {
            reactionRepository.deleteReaction(memberId, articleId);
            reactionRepository.decreaseArticleLikeCount(articleId);
            
            reactionRepository.insertDislikeReaction(memberId, articleId);
            reactionRepository.increaseArticleDislikeCount(articleId);
            return ResultData.from("S-3", "좋아요를 취소하고 싫어요를 눌렀습니다.");
        }

        reactionRepository.insertDislikeReaction(memberId, articleId);
        reactionRepository.increaseArticleDislikeCount(articleId);
        return ResultData.from("S-1", "싫어요를 눌렀습니다.");
    }
}