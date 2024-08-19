package com.tenco.main.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tenco.main.model.PostList;

@Mapper
public interface PostRepository {
    void insert(PostList post);

    List<PostList> findAll(@Param("offset") int offset, @Param("limit") int limit);

    PostList findById(Long id);

    void update(PostList post);

    void delete(Long id);
   
    int count();
}
