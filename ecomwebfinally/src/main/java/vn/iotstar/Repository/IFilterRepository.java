package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Delivery;
import vn.iotstar.entity.Filter;

@Repository
public interface IFilterRepository extends JpaRepository<Filter, Integer> {

}
