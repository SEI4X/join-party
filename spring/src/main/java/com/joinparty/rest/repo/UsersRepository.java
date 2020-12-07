package com.joinparty.rest.repo;

import com.joinparty.rest.domain.Users;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface UsersRepository extends CrudRepository<Users, Integer> {

    @Query(value = "SELECT * FROM users WHERE  (email = ?1  OR phone = ?1 OR login = ?1) AND password = ?2",
    nativeQuery = true)
    Iterable<Users> findAllUsersByPass(String login, String password);

    @Modifying
    @Query(
            value = "insert into users (password, email, first_name, second_name) values (:password, :email, :first_name, :second_name)",
            nativeQuery = true)
    void regUser(@Param("password") String password, @Param("email") String email,
                    @Param("first_name") String first_name, @Param("second_name") String second_name);
}
