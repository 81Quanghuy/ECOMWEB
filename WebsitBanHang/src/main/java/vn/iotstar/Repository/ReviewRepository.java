package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.iotstar.Entity.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {

}
