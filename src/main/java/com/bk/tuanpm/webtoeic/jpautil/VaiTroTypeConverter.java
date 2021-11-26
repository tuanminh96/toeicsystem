//package com.bk.tuanpm.webtoeic.jpautil;
//
//import javax.persistence.AttributeConverter;
//import javax.persistence.Converter;
//
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.bk.tuanpm.webtoeic.entities.Role;
//import com.bk.tuanpm.webtoeic.service.RoleService;
//
//@Converter
//public class VaiTroTypeConverter implements AttributeConverter<Role, Integer> {
//
//	@Autowired
//	RoleService roleService;
//	@Override
//	public Integer convertToDatabaseColumn(Role vaiTro) {
//		return vaiTro.getCode();
//	}
//
//	@Override
//	public Role convertToEntityAttribute(Integer value) {
//		Role role = roleService.getRole(value);
//		if(role != null) { return role; }
//		else
//			throw new IllegalArgumentException(" Illegal tagType value exception.");
//	}
//}
