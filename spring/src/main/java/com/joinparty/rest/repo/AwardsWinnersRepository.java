package com.joinparty.rest.repo;

import com.joinparty.rest.domain.AwardsWinners;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface AwardsWinnersRepository extends CrudRepository<AwardsWinners, Integer> {

    @Query(value = "SELECT * FROM awards_winners WHERE  winner_id = ?1",
            nativeQuery = true)
    Iterable<AwardsWinners> findByUserId(Integer winner_id);

}
