package com.tenco.main.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class PostList {
    private Long id;
    private String title;
    private String content;
    private String username;
    private Timestamp createdAt;
}
