package fr.formation.demo.api;

import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import fr.formation.demo.api.dto.mapper.HelloMapper;
import fr.formation.demo.api.dto.request.CreateOrUpdateHelloRequest;
import fr.formation.demo.api.dto.response.EntityCreatedOrUpdatedResponse;
import fr.formation.demo.api.dto.response.HelloResponse;
import fr.formation.demo.model.Hello;
import fr.formation.demo.repo.HelloRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/hello")
@RequiredArgsConstructor
@Log4j2
public class HelloApiController {
    private final HelloRepository repository;
    private final HelloMapper mapper;

    @GetMapping
    public List<HelloResponse> findAll() {
        log.info("Finding all messages ...");

        return this.mapper.map(this.repository.findAll());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public EntityCreatedOrUpdatedResponse create(@RequestBody CreateOrUpdateHelloRequest request) {
        log.info("Creating new message ...");

        Hello hello = this.mapper.map(request);

        this.repository.save(hello);

        log.info("Message {} created!", hello.getId());

        return new EntityCreatedOrUpdatedResponse(hello.getId());
    }

    @PutMapping("/{id}")
    @Transactional
    public EntityCreatedOrUpdatedResponse update(@PathVariable UUID id, @RequestBody CreateOrUpdateHelloRequest request) {
        log.info("Updating message {} ...", id);

        Hello hello = this.repository.findById(id).orElseThrow();

        this.mapper.map(request, hello);

        this.repository.save(hello);

        log.info("Message {} updated!", id);

        return new EntityCreatedOrUpdatedResponse(id);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteById(@PathVariable UUID id) {
        log.info("Deleting message {} ...", id);

        this.repository.deleteById(id);

        log.info("Message {} deleted!", id);
    }
}
