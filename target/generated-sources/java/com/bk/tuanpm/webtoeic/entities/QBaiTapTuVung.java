package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBaiTapTuVung is a Querydsl query type for BaiTapTuVung
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QBaiTapTuVung extends EntityPathBase<BaiTapTuVung> {

    private static final long serialVersionUID = -1862140020L;

    public static final QBaiTapTuVung baiTapTuVung = new QBaiTapTuVung("baiTapTuVung");

    public final StringPath anhbaituvung = createString("anhbaituvung");

    public final NumberPath<Integer> baitaptuvungid = createNumber("baitaptuvungid", Integer.class);

    public final StringPath tenbaituvung = createString("tenbaituvung");

    public QBaiTapTuVung(String variable) {
        super(BaiTapTuVung.class, forVariable(variable));
    }

    public QBaiTapTuVung(Path<? extends BaiTapTuVung> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBaiTapTuVung(PathMetadata metadata) {
        super(BaiTapTuVung.class, metadata);
    }

}

