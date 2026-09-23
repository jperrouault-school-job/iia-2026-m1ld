package fr.formation.demo.api.dto.mapper;

import java.util.List;

import org.mapstruct.BeanMapping;
import org.mapstruct.InheritConfiguration;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;

import fr.formation.demo.api.dto.request.CreateOrUpdateHelloRequest;
import fr.formation.demo.api.dto.response.HelloResponse;
import fr.formation.demo.model.Hello;

@Mapper(componentModel = "spring")
public interface HelloMapper {
    public List<HelloResponse> map(List<Hello> hellos);

    @Mapping(target = "id", ignore = true)
    public Hello map(CreateOrUpdateHelloRequest request);

    @InheritConfiguration
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    public void map(CreateOrUpdateHelloRequest request, @MappingTarget Hello hello);
}

