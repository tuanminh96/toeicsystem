package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QPartToeic is a Querydsl query type for PartToeic
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QPartToeic extends EntityPathBase<PartToeic> {

    private static final long serialVersionUID = 837733847L;

    public static final QPartToeic partToeic = new QPartToeic("partToeic");

    public final StringPath description = createString("description");

    public final NumberPath<Integer> idPart = createNumber("idPart", Integer.class);

    public final StringPath partName = createString("partName");

    public final NumberPath<Integer> questionTotal = createNumber("questionTotal", Integer.class);

    public final NumberPath<Integer> setQuestionTotal = createNumber("setQuestionTotal", Integer.class);

    public final NumberPath<Integer> timeForTest = createNumber("timeForTest", Integer.class);

    public final StringPath type = createString("type");

    public QPartToeic(String variable) {
        super(PartToeic.class, forVariable(variable));
    }

    public QPartToeic(Path<? extends PartToeic> path) {
        super(path.getType(), path.getMetadata());
    }

    public QPartToeic(PathMetadata metadata) {
        super(PartToeic.class, metadata);
    }

}

