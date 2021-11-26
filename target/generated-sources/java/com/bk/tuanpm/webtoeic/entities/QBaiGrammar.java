package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBaiGrammar is a Querydsl query type for BaiGrammar
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QBaiGrammar extends EntityPathBase<BaiGrammar> {

    private static final long serialVersionUID = -286029097L;

    public static final QBaiGrammar baiGrammar = new QBaiGrammar("baiGrammar");

    public final StringPath anhbaigrammar = createString("anhbaigrammar");

    public final NumberPath<Integer> baigrammarid = createNumber("baigrammarid", Integer.class);

    public final StringPath contentHTML = createString("contentHTML");

    public final StringPath contentMarkDown = createString("contentMarkDown");

    public final StringPath tenbaigrammar = createString("tenbaigrammar");

    public QBaiGrammar(String variable) {
        super(BaiGrammar.class, forVariable(variable));
    }

    public QBaiGrammar(Path<? extends BaiGrammar> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBaiGrammar(PathMetadata metadata) {
        super(BaiGrammar.class, metadata);
    }

}

