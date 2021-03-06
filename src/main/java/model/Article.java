package model;

import java.io.Serializable;

public class Article implements Serializable {

    private int article_id;
    private String title;
    private String content;
    private int likeNum;
    private int good;
    private int collect;
    private int commentNum;
    private String updatatime;
    private int isadmin;
    private Author author;
    private int flg;
    private int isessence;
    private int readeNum;
    private int forum_id;



    public int getForum_id() {
        return forum_id;
    }

    public void setForum_id(int forum_id) {
        this.forum_id = forum_id;
    }

    public int getReadeNum() {
        return readeNum;
    }

    public void setReadeNum(int readeNum) {
        this.readeNum = readeNum;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }



    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }

    public int getCollect() {
        return collect;
    }

    public void setCollect(int collect) {
        this.collect = collect;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public int getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(int commentNum) {
        this.commentNum = commentNum;
    }

    public String getUpdatatime() {
        return updatatime;
    }

    public void setUpdatatime(String updatatime) {
        this.updatatime = updatatime;
    }


    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public int getFlg() {
        return flg;
    }

    public void setFlg(int flg) {
        this.flg = flg;
    }

    public int getIsessence() {
        return isessence;
    }

    public void setIsessence(int isessence) {
        this.isessence = isessence;
    }

    public int getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(int isadmin) {
        this.isadmin = isadmin;
    }

    @Override
    public String toString() {
        return "Article{" +
                "article_id=" + article_id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", like=" + likeNum +
                ", good=" + good +
                ", collect=" + collect +
                ", comment=" + commentNum +
                ", updatatime='" + updatatime + '\'' +
                ", isadmin=" + isadmin +
                ", author=" + author +
                ", flg=" + flg +
                ", isessence=" + isessence +
                ", readeNum=" + readeNum +
                ", forum_id=" + forum_id +
                '}';
    }
}
