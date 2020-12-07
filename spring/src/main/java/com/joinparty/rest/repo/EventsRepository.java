package com.joinparty.rest.repo;

import com.joinparty.rest.domain.Events;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface EventsRepository extends CrudRepository<Events, Integer> {
    @Query(value = "SELECT * FROM join_party.events WHERE creator_id = ?1",
            nativeQuery = true)
    Iterable<Events> findByCreatorId(Integer creator_id);

    @Query(value = "SELECT * FROM join_party.events",
            nativeQuery = true)
    Iterable<Events> findAllEvents();
}
