package com.joinparty.rest.repo;

import com.joinparty.rest.domain.Messages;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface MessagesRepository extends CrudRepository<Messages, Integer> {
    @Query(value = "SELECT * FROM messages WHERE  sender_id = ?1 or receiver_id = ?1",
            nativeQuery = true)
    Iterable<Messages> findByUserId(Integer user_id);
}
