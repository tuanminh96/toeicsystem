package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QRemark is a Querydsl query type for Remark
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QRemark extends EntityPathBase<Remark> {

    private static final long serialVersionUID = 1337583386L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QRemark remark1 = new QRemark("remark1");

    public final QAdmin adminRemark;

    public final NumberPath<Integer> idRemark = createNumber("idRemark", Integer.class);

    public final StringPath remark = createString("remark");

    public final DateTimePath<java.util.Date> timeRemark = createDateTime("timeRemark", java.util.Date.class);

    public final QUser user;

    public QRemark(String variable) {
        this(Remark.class, forVariable(variable), INITS);
    }

    public QRemark(Path<? extends Remark> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QRemark(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QRemark(PathMetadata metadata, PathInits inits) {
        this(Remark.class, metadata, inits);
    }

    public QRemark(Class<? extends Remark> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.adminRemark = inits.isInitialized("adminRemark") ? new QAdmin(forProperty("adminRemark"), inits.get("adminRemark")) : null;
        this.user = inits.isInitialized("user") ? new QUser(forProperty("user"), inits.get("user")) : null;
    }

}

