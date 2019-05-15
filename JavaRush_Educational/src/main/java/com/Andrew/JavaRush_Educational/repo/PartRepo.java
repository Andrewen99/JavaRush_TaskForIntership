package com.Andrew.JavaRush_Educational.repo;

import com.Andrew.JavaRush_Educational.domain.Part;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PartRepo extends JpaRepository<Part, Long> {
    Page<Part> findAll(Pageable pageable);
    Page<Part> findAllByRequirement(Pageable pageable, boolean requirement);
    Page<Part> findByName(Pageable pageable, String name);
    Part findByName(String name);

}
