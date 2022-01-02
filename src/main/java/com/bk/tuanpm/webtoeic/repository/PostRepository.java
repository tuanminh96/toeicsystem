package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Group;
import com.bk.tuanpm.webtoeic.entities.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {
	public List<Post> findAllByGroupOrderByDatePostDesc(Group group);
}
