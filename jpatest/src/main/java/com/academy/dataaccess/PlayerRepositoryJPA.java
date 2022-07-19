package com.academy.dataaccess;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.academy.entity.Player;

@Repository
public interface PlayerRepositoryJPA extends JpaRepository<Player, Long>{
}
