package com.joinparty.rest.repo;

import com.joinparty.rest.domain.EventMessages;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface EventMessagesRepository extends CrudRepository<EventMessages, Integer> {
    @Query(value = "SELECT * FROM event_messages WHERE  event_chat_id = ?1",
            nativeQuery = true)
    Iterable<EventMessages> findByEventId(Integer event_chat_id);
}
