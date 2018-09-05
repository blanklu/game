package service;

import model.FindListResult;
import model.Forum;
import model.Page;

import java.util.List;

public interface IForumService {


    FindListResult findList(Page page);

    Forum findById(int id);
}
