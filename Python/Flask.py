from flask import render_template, request
import json
from flask_login import login_required
from flask import Blueprint
# from .models import Features
# from . import db

main = Blueprint('main', __name__)


@main.route('/dashboard', methods=["POST", "GET"])
@login_required
def home():
    # if current_user.is_authenticated:
    #     return render_template('login.html')

    if request.method == 'POST':
        feature_name = request.form['feature_name']
        feature_weightage = request.form['weightage']
        feature_description = request.form['description']
        feature_status = request.form['status']
        feature_source = request.form['source']
        # print(feature_status)
        my_data = Features(
            feature_name=feature_name,
            feature_weightage=feature_weightage,
            feature_description=feature_description,
            status=feature_status,
            source=feature_source
        )
        db.session.add(my_data)
        db.session.commit()
        features_data = Features.query.all()
        total_weight = 0
        for features in features_data:
            total_weight += features.feature_weightage

        context = {
            "features_data": features_data,
            "total_weight": total_weight
        }
        return render_template("home.html", context=context)

    features_data = Features.query.all()
    total_weight = 0
    for features in features_data:
        if features.status == "Active":
            total_weight += features.feature_weightage

    context = {
        "features_data": features_data,
        "total_weight": total_weight
    }
    return render_template("home.html", context=context)


@main.route('/update', methods=['POST'])
def update():
    # print("METHOD: ", request.method)
    try:
        if request.method == 'POST':
            test = request.get_json()

            features_data = Features.query.all()
            total_weight = 0
            for features in features_data:
                if features.feature_id != test['id']:
                    total_weight = features.feature_weightage + total_weight

            # if int(test['weightage']) + int(total_weight) > 100:
            #     json_msg = {
            #         "status": False,
            #         'message': 'Weightage Exceeded 100'
            #     }
            #     return json.dumps(json_msg)
            # if int(test['weightage'])+int(total_weight) < 100:
            # json_msg = {
            #     "status": False,
            #     'message': 'Weightage lower than 100'
            # }
            # return json.dumps(json_msg)

            req_id = test['id']
            my_data = Features.query.filter_by(feature_id=req_id).first()
            my_data.feature_weightage = test['weightage']
            my_data.feature_description = test['description']
            my_data.status = test['status']
            # my_data.source = test['source']
            db.session.commit()
            json_msg = {
                "status": True,
                'message': 'Data Updated Successfully'
            }
            return json.dumps(json_msg)
    except BaseException as e:
        json_msg = {
            "status": False,
            'message': e
        }
        return json.dumps(json_msg)

# @app.route('/delete/<id>', methods=['GET', 'POST'])
# def delete(id):
#     my_data = Features.query.get(id)
#     db.session.delete(my_data)
#     db.session.commit()
#     return redirect(url_for('home'))
# if request.method == 'POST':
#     id = request.form["id"]
#     my_data = Features.query.filter_by(feature_id=id).first()
#     db.session.delete(my_data)
#     db.session.commit()
#     return redirect(url_for('home'))