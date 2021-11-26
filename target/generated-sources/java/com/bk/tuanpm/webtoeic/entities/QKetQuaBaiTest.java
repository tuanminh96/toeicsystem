package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QKetQuaBaiTest is a Querydsl query type for KetQuaBaiTest
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QKetQuaBaiTest extends EntityPathBase<KetQuaBaiTest> {

    private static final long serialVersionUID = 1063890783L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QKetQuaBaiTest ketQuaBaiTest = new QKetQuaBaiTest("ketQuaBaiTest");

    public final QBaiThiThu baithithu;

    public final NumberPath<Integer> correctlisten = createNumber("correctlisten", Integer.class);

    public final NumberPath<Integer> correctreading = createNumber("correctreading", Integer.class);

    public final NumberPath<Integer> ketquaid = createNumber("ketquaid", Integer.class);

    public final DateTimePath<java.util.Date> ngaythi = createDateTime("ngaythi", java.util.Date.class);

    public final QNguoiDung nguoidung;

    public final NumberPath<Integer> socaudung = createNumber("socaudung", Integer.class);

    public final NumberPath<Integer> socausai = createNumber("socausai", Integer.class);

    public QKetQuaBaiTest(String variable) {
        this(KetQuaBaiTest.class, forVariable(variable), INITS);
    }

    public QKetQuaBaiTest(Path<? extends KetQuaBaiTest> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QKetQuaBaiTest(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QKetQuaBaiTest(PathMetadata metadata, PathInits inits) {
        this(KetQuaBaiTest.class, metadata, inits);
    }

    public QKetQuaBaiTest(Class<? extends KetQuaBaiTest> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.baithithu = inits.isInitialized("baithithu") ? new QBaiThiThu(forProperty("baithithu")) : null;
        this.nguoidung = inits.isInitialized("nguoidung") ? new QNguoiDung(forProperty("nguoidung"), inits.get("nguoidung")) : null;
    }

}

