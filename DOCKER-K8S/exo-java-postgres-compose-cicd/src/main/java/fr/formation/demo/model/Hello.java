package fr.formation.demo.model;

import java.util.UUID;

import org.hibernate.annotations.UuidGenerator;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "hello")
@Getter  @Setter
public class Hello {
    @Id
    @UuidGenerator
    @Column(name = "hel_id")
    private UUID id;

    @Column(name = "hel_message")
    private String message;
}
