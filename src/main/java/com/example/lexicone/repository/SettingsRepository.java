package com.example.lexicone.repository;

import com.example.lexicone.model.Settings;
import com.example.lexicone.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SettingsRepository extends CrudRepository<Settings, Long> {
    Settings findFirstByUser(User user);
}
