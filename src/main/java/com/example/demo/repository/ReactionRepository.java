package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReactionRepository {
    public int getReactionCount(int memberId, int articleId);
    
    public void insertLikeReaction(int memberId, int articleId);
    public void increaseArticleLikeCount(int articleId);
    public void decreaseArticleLikeCount(int articleId);
    
    public void insertDislikeReaction(int memberId, int articleId);
    public void increaseArticleDislikeCount(int articleId);
    public void decreaseArticleDislikeCount(int articleId);
    
    public void deleteReaction(int memberId, int articleId);

	public Integer getReactionPoint(int memberId, int articleId);
}