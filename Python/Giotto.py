from sklearn.ensemble import RandomForestClassifier
from gtda.pipeline import make_pipeline
from sklearn.model_selection import train_test_split

X_train, X_valid, y_train, y_valid = train_test_split(point_clouds, labels)
RFC = RandomForestClassifier()
model = make_pipeline(VR, PE, RFC)
model.fit(X_train, y_train)
model.score(X_valid, y_valid)