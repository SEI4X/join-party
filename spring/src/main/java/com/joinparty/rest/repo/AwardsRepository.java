package com.joinparty.rest.repo;

import com.joinparty.rest.domain.Awards;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface AwardsRepository extends CrudRepository<Awards, Integer> {

    @Query(value = "SELECT * FROM awards WHERE  award_name = ?1",
            nativeQuery = true)
    Iterable<Awards> findByName(String name);

}
