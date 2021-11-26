package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBaiThiThu is a Querydsl query type for BaiThiThu
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QBaiThiThu extends EntityPathBase<BaiThiThu> {

    private static final long serialVersionUID = 76836508L;

    public static final QBaiThiThu baiThiThu = new QBaiThiThu("baiThiThu");

    public final StringPath anhbaithithu = createString("anhbaithithu");

    public final NumberPath<Integer> baithithuid = createNumber("baithithuid", Integer.class);

    public final StringPath tenbaithithu = createString("tenbaithithu");

    public QBaiThiThu(String variable) {
        super(BaiThiThu.class, forVariable(variable));
    }

    public QBaiThiThu(Path<? extends BaiThiThu> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBaiThiThu(PathMetadata metadata) {
        super(BaiThiThu.class, metadata);
    }

}

