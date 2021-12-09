package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QAdmin is a Querydsl query type for Admin
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QAdmin extends EntityPathBase<Admin> {

    private static final long serialVersionUID = 1412891765L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QAdmin admin = new QAdmin("admin");

    public final QAccount _super;

    //inherited
    public final StringPath diaChi;

    //inherited
    public final StringPath email;

    //inherited
    public final NumberPath<Integer> gender;

    //inherited
    public final StringPath hoTen;

    //inherited
    public final NumberPath<Integer> id;

    //inherited
    public final BooleanPath isDelete;

    public final DateTimePath<java.util.Date> joinDate = createDateTime("joinDate", java.util.Date.class);

    //inherited
    public final StringPath password;

    // inherited
    public final QRole role;

    //inherited
    public final StringPath soDienThoai;

    //inherited
    public final StringPath username;

    public QAdmin(String variable) {
        this(Admin.class, forVariable(variable), INITS);
    }

    public QAdmin(Path<? extends Admin> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QAdmin(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QAdmin(PathMetadata metadata, PathInits inits) {
        this(Admin.class, metadata, inits);
    }

    public QAdmin(Class<? extends Admin> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new QAccount(type, metadata, inits);
        this.diaChi = _super.diaChi;
        this.email = _super.email;
        this.gender = _super.gender;
        this.hoTen = _super.hoTen;
        this.id = _super.id;
        this.isDelete = _super.isDelete;
        this.password = _super.password;
        this.role = _super.role;
        this.soDienThoai = _super.soDienThoai;
        this.username = _super.username;
    }

}

