package com.joinparty.rest.repo;

import com.joinparty.rest.domain.Friends;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface FriendsRepository extends CrudRepository<Friends, Integer> {
    @Query(value = "SELECT * FROM friends WHERE  friend_one = ?1 or friend_two = ?1",
            nativeQuery = true)
    Iterable<Friends> findByUserId(Integer user_id);
}
