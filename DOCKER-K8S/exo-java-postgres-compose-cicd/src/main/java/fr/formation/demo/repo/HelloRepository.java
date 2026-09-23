package fr.formation.demo.repo;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.formation.demo.model.Hello;

public interface HelloRepository extends JpaRepository<Hello, UUID> {

}
