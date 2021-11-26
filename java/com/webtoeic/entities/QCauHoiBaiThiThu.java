package com.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;

import com.bk.tuanpm.webtoeic.entities.CauHoiBaiThiThu;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QCauHoiBaiThiThu is a Querydsl query type for CauHoiBaiThiThu
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCauHoiBaiThiThu extends EntityPathBase<CauHoiBaiThiThu> {

    private static final long serialVersionUID = 718972271L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCauHoiBaiThiThu cauHoiBaiThiThu = new QCauHoiBaiThiThu("cauHoiBaiThiThu");

    public final StringPath audiomp3 = createString("audiomp3");

    public final QBaiThiThu baithithu;

    public final NumberPath<Integer> cauhoibaithithuid = createNumber("cauhoibaithithuid", Integer.class);

    public final StringPath correctanswer = createString("correctanswer");

    public final StringPath dapAnUser = createString("dapAnUser");

    public final StringPath image = createString("image");

    public final NumberPath<Integer> number = createNumber("number", Integer.class);

    public final StringPath option1 = createString("option1");

    public final StringPath option2 = createString("option2");

    public final StringPath option3 = createString("option3");

    public final StringPath option4 = createString("option4");

    public final StringPath paragraph = createString("paragraph");

    public final StringPath question = createString("question");

    public QCauHoiBaiThiThu(String variable) {
        this(CauHoiBaiThiThu.class, forVariable(variable), INITS);
    }

    public QCauHoiBaiThiThu(Path<? extends CauHoiBaiThiThu> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QCauHoiBaiThiThu(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QCauHoiBaiThiThu(PathMetadata metadata, PathInits inits) {
        this(CauHoiBaiThiThu.class, metadata, inits);
    }

    public QCauHoiBaiThiThu(Class<? extends CauHoiBaiThiThu> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.baithithu = inits.isInitialized("baithithu") ? new QBaiThiThu(forProperty("baithithu")) : null;
    }

}

