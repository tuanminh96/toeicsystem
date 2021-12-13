package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QGroupMember is a Querydsl query type for GroupMember
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QGroupMember extends EntityPathBase<GroupMember> {

    private static final long serialVersionUID = -1467457889L;

    public static final QGroupMember groupMember = new QGroupMember("groupMember");

    public final DateTimePath<java.util.Date> addDate = createDateTime("addDate", java.util.Date.class);

    public final NumberPath<Integer> group = createNumber("group", Integer.class);

    public final NumberPath<Integer> idGroupMember = createNumber("idGroupMember", Integer.class);

    public final NumberPath<Integer> isDisabled = createNumber("isDisabled", Integer.class);

    public final StringPath updateBy = createString("updateBy");

    public final DateTimePath<java.util.Date> updateDate = createDateTime("updateDate", java.util.Date.class);

    public final NumberPath<Integer> user = createNumber("user", Integer.class);

    public QGroupMember(String variable) {
        super(GroupMember.class, forVariable(variable));
    }

    public QGroupMember(Path<? extends GroupMember> path) {
        super(path.getType(), path.getMetadata());
    }

    public QGroupMember(PathMetadata metadata) {
        super(GroupMember.class, metadata);
    }

}

