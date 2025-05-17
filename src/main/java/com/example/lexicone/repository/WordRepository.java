package com.example.lexicone.repository;

import com.example.lexicone.model.Dictionary;
import com.example.lexicone.model.Word;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WordRepository extends CrudRepository<Word, Long> {
    List<Word> findAllByDictionary(Dictionary dictionary);

    List<Word> findAll();

}
