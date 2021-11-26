package com.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;

import com.bk.tuanpm.webtoeic.entities.NguoiDung;
import com.bk.tuanpm.webtoeic.entities.VaiTro;
import com.querydsl.core.types.Path;


/**
 * QNguoiDung is a Querydsl query type for NguoiDung
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QNguoiDung extends EntityPathBase<NguoiDung> {

    private static final long serialVersionUID = -2027072380L;

    public static final QNguoiDung nguoiDung = new QNguoiDung("nguoiDung");

    public final StringPath diaChi = createString("diaChi");

    public final StringPath email = createString("email");

    public final StringPath hoTen = createString("hoTen");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath password = createString("password");

    public final StringPath soDienThoai = createString("soDienThoai");

    public final EnumPath<VaiTro> vaiTro = createEnum("vaiTro", VaiTro.class);

    public QNguoiDung(String variable) {
        super(NguoiDung.class, forVariable(variable));
    }

    public QNguoiDung(Path<? extends NguoiDung> path) {
        super(path.getType(), path.getMetadata());
    }

    public QNguoiDung(PathMetadata metadata) {
        super(NguoiDung.class, metadata);
    }

}

