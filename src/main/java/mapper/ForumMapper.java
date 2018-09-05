package mapper;

import model.Forum;
import model.Page;

import java.util.List;

public interface ForumMapper {
    Forum selectById(int id);
    List<Forum> selectList(Page page);
    int selectCount();
}
