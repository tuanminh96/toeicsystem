package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QNguoiDung is a Querydsl query type for NguoiDung
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QNguoiDung extends EntityPathBase<NguoiDung> {

    private static final long serialVersionUID = 267129350L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QNguoiDung nguoiDung = new QNguoiDung("nguoiDung");

    public final StringPath description = createString("description");

    public final StringPath diaChi = createString("diaChi");

    public final StringPath email = createString("email");

    public final NumberPath<Integer> gender = createNumber("gender", Integer.class);

    public final StringPath hoTen = createString("hoTen");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final BooleanPath isDelete = createBoolean("isDelete");

    public final NumberPath<Integer> isVip = createNumber("isVip", Integer.class);

    public final DatePath<java.sql.Date> joinDate = createDate("joinDate", java.sql.Date.class);

    public final StringPath password = createString("password");

    public final QRole role;

    public final StringPath school = createString("school");

    public final StringPath soDienThoai = createString("soDienThoai");

    public QNguoiDung(String variable) {
        this(NguoiDung.class, forVariable(variable), INITS);
    }

    public QNguoiDung(Path<? extends NguoiDung> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QNguoiDung(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QNguoiDung(PathMetadata metadata, PathInits inits) {
        this(NguoiDung.class, metadata, inits);
    }

    public QNguoiDung(Class<? extends NguoiDung> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.role = inits.isInitialized("role") ? new QRole(forProperty("role")) : null;
    }

}

