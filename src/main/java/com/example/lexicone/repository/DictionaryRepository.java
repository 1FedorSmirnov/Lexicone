package com.example.lexicone.repository;


import com.example.lexicone.model.Dictionary;
import com.example.lexicone.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface DictionaryRepository extends CrudRepository<Dictionary, Long> {

    List<Dictionary> findAll();

    List<Dictionary> findByUser(User user);

}
