package com.tenco.main.board;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tenco.main.model.PostList;
import com.tenco.main.util.PostService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

    @Autowired
    private final PostService postService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/saveForm")
    public String saveForm() {
        return "board/saveForm";
    }

    @PostMapping("/save")
    public String save(@RequestParam ("username") String username, 
    								@RequestParam ("title") String title, 
    								@RequestParam ("content") String content) {
        PostList post = PostList.builder()
        		.username(username)
                .title(title)
                .content(content)
                .createdAt(new Timestamp(System.currentTimeMillis()))
                .build();
        postService.savePost(post);
        return "redirect:/board/list";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam(name = "id")Long id, Model model) {
        model.addAttribute("id", id);
        PostList post = postService.getPostById(id);
        model.addAttribute("post", post);
        return "board/updateForm";
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") Long id, 
    									@RequestParam("title") String title, 
    									@RequestParam("content") String content, 
    									@RequestParam("username") String username) {
    	System.out.println("업데이트");
        PostList post = PostList.builder()
                .id(id)
                .title(title)
                .content(content)
                .username(username)
                .build();
        postService.updatePost(post);
        return "redirect:/board/list";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        postService.deletePost(id);
        return "redirect:/board/list";
    }

    @GetMapping("/list")
    public String list(@RequestParam(name = "page", defaultValue = "1") int page, 
    							@RequestParam(name = "size", defaultValue = "5") int size, 
    							Model model) {
        List<PostList> posts = postService.getAllPosts(page, size);
        int totalCount = postService.getTotalCount();
        int totalPages = (int) Math.ceil((double) totalCount / size);

        model.addAttribute("posts", posts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems", totalCount);

        return "board/list";
    }
}
