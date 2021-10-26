virtualenv venv || exit 1
. venv/bin/activate || exit 1
pip install -e ote_cli || exit 1
pip install -e $SC_SDK_REPO/src/ote_sdk || exit 1
echo ""
echo ""
pytest tests/ote_cli/ --collect-only || exit 1
echo "Sleep 5 sec before actually running tests."
sleep 5
pytest tests/ote_cli/test_ote_cli_tools_classification.py::TestOteCliWithCLASSIFICATION::test_ote_train_CLASSIFICATION__external/deep-object-reid/configs/ote_custom_classification/efficientnet_b0 -s -v
