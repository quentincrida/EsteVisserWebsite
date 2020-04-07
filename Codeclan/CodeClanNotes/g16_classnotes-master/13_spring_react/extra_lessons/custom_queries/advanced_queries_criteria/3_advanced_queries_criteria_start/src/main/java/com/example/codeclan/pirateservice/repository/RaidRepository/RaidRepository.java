package com.example.codeclan.pirateservice.repository.RaidRepository;

import com.example.codeclan.pirateservice.models.Raid;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


import java.util.List;

@RepositoryRestResource
public interface RaidRepository extends JpaRepository<Raid, Long>, RaidRepositoryCustom {
    List<Raid> findRaidByLocation(String location);
}
