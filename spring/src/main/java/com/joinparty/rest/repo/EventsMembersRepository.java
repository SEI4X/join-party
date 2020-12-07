package com.joinparty.rest.repo;

import com.joinparty.rest.domain.EventsMembers;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface EventsMembersRepository extends CrudRepository<EventsMembers, Integer> {
    @Query(value = "SELECT * FROM events_members WHERE event_id = ?1",
            nativeQuery = true)
    Iterable<EventsMembers> findByEventId(Integer event_id);

    @Query(value = "SELECT * FROM events_members WHERE event_id = ?1 and user_id = ?2",
            nativeQuery = true)
    Iterable<EventsMembers> findByUserId(Integer event_id, Integer user_id);
}
