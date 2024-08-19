package com.tenco.main.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tenco.main.model.PostList;
import com.tenco.main.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	 private PostRepository postRepository;

	
	
    public List<PostList> getAllPosts(int page, int size) {
    	
    	int offset = (page - 1) * size;
        return postRepository.findAll(offset, size);
    }
	
    public void savePost(PostList post) {
        postRepository.insert(post);
    }
    
    public PostList getPostById(Long id) {
        return postRepository.findById(id);
    }

    public void updatePost(PostList post) {
        postRepository.update(post);
    }

    public void deletePost(Long id) {
        postRepository.delete(id);
    }
    public int getTotalCount() {
        return postRepository.count();
    }

}