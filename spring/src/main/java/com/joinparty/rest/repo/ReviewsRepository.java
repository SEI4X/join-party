package com.joinparty.rest.repo;

import com.joinparty.rest.domain.Reviews;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ReviewsRepository extends CrudRepository<Reviews, Integer> {
    @Query(value = "SELECT * FROM reviews WHERE  user_id = ?1",
            nativeQuery = true)
    Iterable<Reviews> findByUserId(Integer user_id);
}
