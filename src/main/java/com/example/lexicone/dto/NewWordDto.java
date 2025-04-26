package com.example.lexicone.dto;

import com.example.lexicone.model.Dictionary;
import lombok.Data;

@Data
public class NewWordDto {

    private String name;
    private String translation;
    private String context;
    private String example;
    private Dictionary dictionary;
}
