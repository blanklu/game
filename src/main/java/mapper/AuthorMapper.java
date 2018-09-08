package mapper;

import model.Article;
import model.Author;
import model.PageArc;

import java.util.List;

public interface AuthorMapper {

    Author selectById(int author_id);
}
