package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QNoiDungBaiTapTuVung is a Querydsl query type for NoiDungBaiTapTuVung
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QNoiDungBaiTapTuVung extends EntityPathBase<NoiDungBaiTapTuVung> {

    private static final long serialVersionUID = 2099227690L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QNoiDungBaiTapTuVung noiDungBaiTapTuVung = new QNoiDungBaiTapTuVung("noiDungBaiTapTuVung");

    public final StringPath audiomp3 = createString("audiomp3");

    public final QBaiTapTuVung baitaptuvung;

    public final StringPath content = createString("content");

    public final StringPath image = createString("image");

    public final StringPath meaning = createString("meaning");

    public final NumberPath<Integer> noidungbaitaptuvungid = createNumber("noidungbaitaptuvungid", Integer.class);

    public final NumberPath<Integer> number = createNumber("number", Integer.class);

    public final StringPath sentence = createString("sentence");

    public final StringPath transcribe = createString("transcribe");

    public QNoiDungBaiTapTuVung(String variable) {
        this(NoiDungBaiTapTuVung.class, forVariable(variable), INITS);
    }

    public QNoiDungBaiTapTuVung(Path<? extends NoiDungBaiTapTuVung> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QNoiDungBaiTapTuVung(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QNoiDungBaiTapTuVung(PathMetadata metadata, PathInits inits) {
        this(NoiDungBaiTapTuVung.class, metadata, inits);
    }

    public QNoiDungBaiTapTuVung(Class<? extends NoiDungBaiTapTuVung> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.baitaptuvung = inits.isInitialized("baitaptuvung") ? new QBaiTapTuVung(forProperty("baitaptuvung")) : null;
    }

}

