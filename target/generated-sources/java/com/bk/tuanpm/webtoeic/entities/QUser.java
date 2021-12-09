package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QUser is a Querydsl query type for User
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QUser extends EntityPathBase<User> {

    private static final long serialVersionUID = -1200738843L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QUser user = new QUser("user");

    public final QAccount _super;

    public final DateTimePath<java.util.Date> addDate = createDateTime("addDate", java.util.Date.class);

    public final StringPath company = createString("company");

    //inherited
    public final StringPath diaChi;

    //inherited
    public final StringPath email;

    //inherited
    public final NumberPath<Integer> gender;

    public final ListPath<Group, QGroup> groups = this.<Group, QGroup>createList("groups", Group.class, QGroup.class, PathInits.DIRECT2);

    //inherited
    public final StringPath hoTen;

    //inherited
    public final NumberPath<Integer> id;

    //inherited
    public final BooleanPath isDelete;

    //inherited
    public final StringPath password;

    // inherited
    public final QRole role;

    public final StringPath school = createString("school");

    //inherited
    public final StringPath soDienThoai;

    //inherited
    public final StringPath username;

    public QUser(String variable) {
        this(User.class, forVariable(variable), INITS);
    }

    public QUser(Path<? extends User> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QUser(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QUser(PathMetadata metadata, PathInits inits) {
        this(User.class, metadata, inits);
    }

    public QUser(Class<? extends User> type, PathMetadata metadata, PathInits inits) {
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

