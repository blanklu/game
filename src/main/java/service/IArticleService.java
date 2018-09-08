package service;

import model.Article;
import model.ArticleDto;
import model.FindListResult;
import model.PageArc;

public interface IArticleService {

    FindListResult findList(PageArc page);

    int remove(int id);

    int add(ArticleDto articleDto);

    Article findById(int id);

    int modify(Article article);
}
