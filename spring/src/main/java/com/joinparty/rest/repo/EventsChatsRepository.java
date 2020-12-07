package com.joinparty.rest.repo;

import com.joinparty.rest.domain.EventsChats;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface EventsChatsRepository extends CrudRepository<EventsChats, Integer> {
    @Query(value = "SELECT * FROM events_chats WHERE chat_name = ?1",
            nativeQuery = true)
    Iterable<EventsChats> findByName(String chat_name);

    @Query(value = "SELECT * FROM events_chats WHERE event_id = ?1",
            nativeQuery = true)
    Iterable<EventsChats> findByEventId(Integer event_id);
}
