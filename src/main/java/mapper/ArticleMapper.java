package mapper;

import model.Article;
import model.ArticleDto;
import model.PageArc;

import java.util.List;

public interface ArticleMapper {

    int selectCount(PageArc page);
    List<Article> selectList(PageArc page);
    int delete(int id);
    Article selectById(int id);

    int insert(ArticleDto articleDto);

    int update(Article article);
}
