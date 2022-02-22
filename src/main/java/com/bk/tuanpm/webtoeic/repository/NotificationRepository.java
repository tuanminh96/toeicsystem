package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Notification;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Integer> {
	public List<Notification> findAllByUserOrderByDateSendDesc(User user);
	
	public Notification findByIdNoti(int idNoti);
	
	public Notification save(Notification notification);
	
	public int countNotificationByUserAndDateSeenIsNull(User user);
}
